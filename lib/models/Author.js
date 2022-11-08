const pool = require('../utils/pool');

class Author {
    constructor(row) {
        this.id = row.id;
        this.name = row.name;
        this.dob = row.dob;
        this.pob = row.pob;
        this.books = row.books;
    }

    static async getById(id) {
        const { rows } = await pool.query(
            `
            select authors.*,
                coalesce(
                  json_agg(to_jsonb(books))
                  filter (WHERE books.id IS NOT NULL), '[]') as books
            from authors left join authors_books
              on authors.id = authors_books.author_id
            left join books on books.id = authors_books.book_id
            where books.id = $1
            group by authors.id;
        `, 
          [id]
        );
        const newAuthor = new Author(rows[0]);
        return newAuthor;
    }



    static async getAll() {
        const { rows } = await pool.query('SELECT * from authors');
        return rows.map((authorRow) => new Author({id: authorRow.id, name: authorRow.name}));
    }
}

module.exports = Author;