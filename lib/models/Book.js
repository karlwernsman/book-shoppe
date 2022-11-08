const pool = require('../utils/pool');

class Book {
  constructor(row) {
    this.id = row.id;
    this.title = row.title;
    this.released = row.released;
    this.authors = row.authors;
  }

  static async getById(id) {
    const { rows } = await pool.query(
      `
            select books.*,
                coalesce(
                      json_agg(to_jsonb(authors))
                      filter (WHERE authors.id IS NOT NULL), '[]') as authors
                from books left join authors_books
                  on books.id = authors_books.book_id
                left join authors on authors_books.author_id = authors.id
                where books.id = $1
                group by books.id
            `,
      [id]
    );
    // return rows.map((newBook) => new Book({title: newBook.title, released: newBook.released, authors:[{ name: newBook.name, id: newBook.id }]}));
    return new Book(rows[0]);
  }

  static async getAll() {
    const { rows } = await pool.query('SELECT * from books');
    return rows.map(
      (bookRow) =>
        new Book({
          id: bookRow.id,
          title: bookRow.title,
          released: bookRow.released,
        })
    );
  }
}

module.exports = Book;
