const pool = require('../utils/pool');

class Author {
    constructor({id, name}) {
        this.id = id;
        this.name = name;
    }

    static async getAll() {
        const { rows } = await pool.query('SELECT * from authors');
        return rows.map((authorRow) => new Author(authorRow));
    }
}

module.exports = Author;