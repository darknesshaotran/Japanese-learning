const ErrorsWithStatus = require('../constants/Error');
const HTTP_STATUS = require('../constants/httpStatus');
const db = require('../models');
const { Op } = require('sequelize');
const courseServices = require('./course.services');

class teacherService {
    async getListTeacher(limit, page, search) {
        var offset = 0;
        if (page && limit) {
            offset = (page - 1) * limit;
        }
        if (!limit) {
            limit = 100;
        }

        const searchCondition = search ? { nick_name: { [Op.like]: `%${search}%` } } : {};
        const options = {
            ...searchCondition,
        };
        const Count = await db.User.count({
            where: {
                ...options,
                role: 'teacher',
            },
        });
        const teachers = await db.User.findAll({
            where: {
                ...options,
            },
            offset: offset,
            limit: limit,
            attributes: {
                exclude: ['password', 'createdAt', 'updatedAt'],
            },
        });
        const Teachers = JSON.parse(JSON.stringify(teachers));
        for (let i = 0; i < Teachers.length; i++) {
            const teacher_detail = await db.Teacher.findOne({
                where: {
                    user_id: Teachers[i].id,
                },
            });
            const Teacher_Detail = JSON.parse(JSON.stringify(teacher_detail));
            Teachers[i].Teacher_Detail = Teacher_Detail;
        }

        const totalPages = Math.ceil(Count / limit);
        return {
            success: true,
            result: Teachers,
            totalPages: totalPages,
            page: page ? page : 1,
        };
    }
    async teacherDetails(id_teacher) {
        const teacher = await db.User.findOne({
            where: {
                id: id_teacher,
            },
            attributes: {
                exclude: ['password', 'createdAt', 'updatedAt'],
            },
            include: [{ model: db.Teacher, as: 'Teacher', attributes: { exclude: ['createdAt', 'updatedAt'] } }],
        });
        if (!teacher) throw new ErrorsWithStatus({ status: HTTP_STATUS.NOT_FOUND, message: 'Teacher not found' });
        const Teacher = JSON.parse(JSON.stringify(teacher));
        console.log(Teacher);
        const teacher_id = Teacher.Teacher.id;
        const course = await courseServices.getListTeacherCourse(teacher_id);
        return {
            success: true,
            result: Teacher,
            courseList: course,
        };
    }
    async createData(req, res, next) {
        for (let i = 0; i < 100; i++) {
            const user = await db.User.create({
                nick_name: 'teacher' + i,
                mail: `teacher${i}@example.com`,
                password: '',
                role: 'teacher',
                gender: Math.random() >= 0.8 ? 1 : 0,
                first_name: `teacher`,
                last_name: i.toString(),
                dob: new Date(),
                status: Math.random() > 0.2 ? 1 : 0,
                avatar: 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg',
            });
            await db.Teacher.create({
                id: i,
                user_id: user.id,
                detail_infor: Math.random() >= 0.5 ? 'nihongo ga jozu desu' : 'nihongo ga omoshiroi desu',
                experience: `${i} năm`,
                jp_level: Math.random() >= 0.6 ? 'N1' : 'N2',
            });
        }
        res.json({ success: true });
    }
}
module.exports = new teacherService();
