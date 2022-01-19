class BookSerializer

  def self.serialize(data, location, weather)
    { data:
      { id: 'null', type: 'books', attributes:
        { destination: location,
          forecast:
          {
            summary: weather.conditions,
            temperature: weather.temp
          },
          total_books_found: data[:total_books_found],
          books: data[:books]
          }
        }
      }
  end
end
