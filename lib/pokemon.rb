class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id: nil, name:, type:, db:)
        self.id = id
        self.name = name
        self.type = type
        self.db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
              INSERT INTO pokemon (name, type)
              VALUES (?, ?)
              SQL

              db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ? LIMIT 1"
        
        row = db.execute(sql, id)[0] # [id, name, type]

        Pokemon.new(id: row[0], name: row[1], type: row[2], db: db)
    end
end