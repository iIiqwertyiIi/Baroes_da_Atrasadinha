# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(username: 'Ademir', email: 'admin@admin', admin: true, password: '123', password_confirmation: '123')
Genre.create([{ name: 'Ação' }, { name: 'Aventura' }, { name: 'Cinema de arte' }, { name: 'Comédia' }, { name: 'Coméida romântica' }, { name: 'Dança' },
              { name: 'Documentário' }, { name: 'Docuficção' }, { name: 'Drama' }, { name: 'Espionagem' }, { name: 'Faroeste' }, { name: 'Fantasia' }, { name: 'Fantasia científica' },
              { name: 'Ficção científica' }, { name: 'Filmes de guerra' }, { name: 'Musical' }, { name: 'Filme policial' }, { name: 'Romance' }, { name: 'Suspense' }, { name: 'Terror' },
              {name: 'Animação'}])
