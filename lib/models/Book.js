const pool = require('../utils/pool');

class Book {
    constructor({id, title, released}) {
        this.id = id;
        this.title = title;
        this.released = released;
    }

    static async getAll() {
        const { rows } = await pool.query('SELECT * from books');
        return rows.map((bookRow) => new Book(bookRow));
    }
}

module.exports = Book;