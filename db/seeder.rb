require 'sqlite3'
require_relative '../config'

db = SQLite3::Database.new(DB_PATH)

puts "Använder databasen: #{DB_PATH}"
puts "🧹 Tar bort gamla tabeller..."
db.execute('DROP TABLE IF EXISTS todos')
db.execute('DROP TABLE IF EXISTS categories')

puts "🧱 Skapar tabeller..."
db.execute('CREATE TABLE todos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL, 
            description TEXT,
            deadline TEXT,
            priority INTEGER,
            completed INTEGER DEFAULT 0 )')
db.execute('CREATE TABLE categories (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            description TEXT)')
# db.execute('CREATE TABLE to_ca (
#             todo_id INTEGER,
#             desc_id INTEGER,
#             PRIMARY KEY 
#             )')

puts "🍎 Fyller på med data..."
db.execute('INSERT INTO todos (name, description, completed) VALUES ("Köp mjölk", "3 liter mellanmjölk, eko", 1)')
db.execute('INSERT INTO todos (name, description, completed) VALUES ("Köp julgran", "En rödgran", 0)')
db.execute('INSERT INTO todos (name, description, completed) VALUES ("Pynta gran", "Glöm inte lamporna i granen och tomten", 0)')

puts "✅ Databasen är seedad!"