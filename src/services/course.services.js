const ErrorsWithStatus = require('../constants/Error');
const HTTP_STATUS = require('../constants/httpStatus');
const db = require('../models');
const { Op } = require('sequelize');

class CourseServices {
    async getListCourse(limit, page, search) {
        var offset = 0;
        if (page && limit) {
            offset = (page - 1) * limit;
        }
        if (!limit) {
            limit = 100;
        }

        const searchCondition = search ? { title: { [Op.like]: `%${search}%` } } : {};
        const options = {
            ...searchCondition,
        };
        const Count = await db.Course.count({
            where: {
                ...options,
            },
        });
        const courses = await db.Course.findAll({
            where: {
                ...options,
            },
            offset: offset,
            limit: limit,
            attributes: {
                exclude: ['createdAt', 'updatedAt'],
            },
            include: [
                {
                    model: db.Teacher,
                    attributes: {
                        exclude: ['createdAt', 'updatedAt'],
                    },
                    include: [
                        {
                            model: db.User,
                            // as: 'inforUser',
                            attributes: {
                                exclude: ['id', 'password', 'createdAt', 'updatedAt'],
                            },
                        },
                    ],
                },
            ],
        });
        const Courses = JSON.parse(JSON.stringify(courses));
        for (let i = 0; i < Courses.length; i++) {
            const rating = await db.Rating.findAll({
                where: {
                    course_id: Courses[i].id,
                },
                attributes: [[db.sequelize.fn('AVG', db.sequelize.col('star')), 'totalStar']],
            });
            const Rating = JSON.parse(JSON.stringify(rating));
            Courses[i].totalStar = Rating[0].totalStar ? Number(Rating[0].totalStar).toFixed(1) : 0;
        }
        const totalPages = Math.ceil(Count / limit);
        return {
            success: true,
            result: Courses,
            totalPages: totalPages,
            page: page ? page : 1,
        };
    }
    async getListTeacherCourse(id_teacher) {
        const courses = await db.Course.findAll({
            where: {
                teacher_id: id_teacher,
            },
            order: [['id', 'DESC']],
            attributes: ['id', 'title', 'description', 'price', 'status'],
        });
        const Courses = JSON.parse(JSON.stringify(courses));
        for (let i = 0; i < Courses.length; i++) {
            const rating = await db.Rating.findAll({
                where: {
                    course_id: Courses[i].id,
                },
                attributes: [[db.sequelize.fn('AVG', db.sequelize.col('star')), 'totalStar']],
            });
            const Rating = JSON.parse(JSON.stringify(rating));
            Courses[i].totalStar = Rating[0].totalStar ? Number(Rating[0].totalStar).toFixed(1) : 0;
        }

        return Courses;
    }
    async CourseDetails(id_course) {
        const course = await db.Course.findOne({
            where: {
                id: id_course,
            },
            attributes: {
                exclude: ['createdAt', 'updatedAt'],
            },
            include: [
                {
                    model: db.Teacher,
                    attributes: {
                        exclude: ['createdAt', 'updatedAt'],
                    },
                    include: [
                        {
                            model: db.User,
                            // as: 'inforUser',
                            attributes: {
                                exclude: ['id', 'password', 'createdAt', 'updatedAt'],
                            },
                        },
                    ],
                },
            ],
        });
        const Course = JSON.parse(JSON.stringify(course));
        const star = await db.Rating.findAll({
            where: {
                course_id: id_course,
            },
            attributes: [[db.sequelize.fn('AVG', db.sequelize.col('star')), 'totalStar']],
        });
        const Star = JSON.parse(JSON.stringify(star));
        if (Course) {
            Course.totalStar = Star[0].totalStar ? Number(Star[0].totalStar) : 0;
            const rating = await db.Rating.findAll({
                where: {
                    course_id: id_course,
                },
                attributes: {
                    exclude: ['createdAt', 'updatedAt'],
                },
                include: [
                    {
                        model: db.User,
                        attributes: {
                            exclude: ['id', 'password', 'createdAt', 'updatedAt'],
                        },
                    },
                ],
            });
            const Rating = JSON.parse(JSON.stringify(rating));
            Course.Rating = Rating;

            ////
            const lesson = await db.Lesson.findAll({
                where: {
                    course_id: id_course,
                },
                attributes: {
                    exclude: ['createdAt', 'updatedAt'],
                },
            });
            const Lesson = JSON.parse(JSON.stringify(lesson));
            Course.Lesson = Lesson;
            return Course;
        } else {
            throw new ErrorsWithStatus({ status: 403, message: 'course not found' });
        }
    }
    // async createData() {
    //     const l = ['basic grammar', 'basic kaiwa', 'advanced grammar', 'advanced kaiwa'];
    //     for (let i = 0; i < 36; i++) {
    //         for (let j = 0; j < 4; j++) {
    //             await db.Lesson.create({
    //                 course_id: i,
    //                 title: l[j],
    //                 description: 'description for ' + l[j],
    //                 url: '',
    //                 status: 1,
    //             });
    //         }
    //     }
    //     return {
    //         success: true,
    //     };
    // }
}

module.exports = new CourseServices();
