# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

badges = Badge.create!([
  { title: 'BigGeek',  image: 'one.jpeg', rule: 'Данная награда выдается в случае успешного прохождения теста с первой попытки',
    method: 'rule_first_try?'},
  { title: 'Strike Level',  image: 'two.jpeg', rule: 'Данная награда выдается в случае успешного прохождения всех тестов определенного уровня',
    method: 'rule_all_level?', option: 1 },
  { title: 'Strike Level',  image: 'two.jpeg', rule: 'Данная награда выдается в случае успешного прохождения всех тестов определенного уровня',
    method: 'rule_all_level?', option: 2 },
  { title: 'Strike Category',  image: 'tree.png', rule: 'Данная награда выдается в случае успешного прохождения всех тестов определенной категории',
    method: 'rule_all_category?', option: 'junior!' },
  { title: 'Strike Category',  image: 'tree.png', rule: 'Данная награда выдается в случае успешного прохождения всех тестов определенной категории',
    method: 'rule_all_category?', option: 'middle!'},
  { title: 'Strike Category',  image: 'tree.png', rule: 'Данная награда выдается в случае успешного прохождения всех тестов определенной категории',
    method: 'rule_all_category?', option: 'senior!' },
])

users = User.create!([
  { first_name: 'One1', email: "One1@gmail1.com", password: 'qweqwe1', password_confirmation: 'qweqwe1' },
  { first_name: 'Two2', email: "Two2@gmail1.com", password: 'asdasd2', password_confirmation: 'asdasd2' },
  { first_name: 'Three3', email: "Three3@gmail1.com", password: 'zxczxc3', password_confirmation: 'zxczxc3' }
])

categories = Category.create!([
  { title: 'junior!' },
  { title: 'middle!' },
  { title: 'senior!' }
])
tests = Test.create!([
  { title: 'Ruby!', level: 0, category: categories[0], author: users[0] },
  { title: 'Git!', level: 1, category: categories[0], author: users[1]},
  { title: 'OOP!', level: 2, category: categories[1], author: users[2] }
])

questions = Question.create!([
  { body: 'Чем отличается each от map?', test: tests[0] },
  { body: 'Какие типы данных используются в Ruby?', test: tests[0] },
  { body: 'Как загрузить удаленный репозиторий?', test: tests[1] },
  { body: 'Для чего нужен SSH-ключ?', test: tests[1] },
  { body: 'Основные принципы ООП', test: tests[2] },
  { body: 'Что такое CRUD?', test: tests[2] }
])

Answer.create!([
  { body: 'each занимается просто перебором, map занимается перебором и конечным выводом измененного массива', correct: true, question: questions[0] },
  { body: 'map занимается просто перебором, each занимается перебором и конечным выводом измененного массива', correct: false, question: questions[0] },
  { body: 'each выводит результат в виде массива, map выводит результат в виде строки значений', correct: false, question: questions[0] },
  { body: 'Числа, логический тип, массивы, строки, ассоциативные массивы, диапазоны значений, символы', correct: true, question: questions[1] },
  { body: 'Числа, массивы, строки, диапазоны значений, символы', correct: false, question: questions[1] },
  { body: 'Числа, логический тип, массивы, строки, абсолютные массивы, диапазоны значений, символы', correct: false, question: questions[1] },
  { body: 'git clone git@github.com:username/project.git', correct: true, question: questions[2] },
  { body: 'git download git@github.com:username/project.git', correct: false, question: questions[2] },
  { body: 'git copy add origin git@github.com:username/project.git', correct: false, question: questions[2] },
  { body: 'SSH-ключи используются для облегчённой авторизации на различных сервисах.', correct: true, question: questions[3] },
  { body: 'SSH-ключи используются для синхронизации различных сервисов с удаленным репозиторием.', correct: false, question: questions[3] },
  { body: 'SSH-ключи используются для настройки автоматической загрузки gem', correct: false, question: questions[3] },
  { body: 'Инкапсуляция, Наследование и Полиморфизм', correct: true, question: questions[4] },
  { body: 'Инкапсуляция, Селективность и Полиморфизм', correct: false, question: questions[4] },
  { body: 'Ассоциативность, Наследование и Полиморфизм', correct: false, question: questions[4] },
  { body: 'Cокращённое именование 4 базовых операций при работе с ресурсами. С-Create, R-Read, U-Update, D-Delete', correct: true, question: questions[5] },
  { body: 'Cокращённое именование 4 базовых операций при работе с ресурсами. С-Create, R-Read, U-Update, D-Download', correct: false, question: questions[5] },
  { body: 'Cокращённое именование 4 базовых операций при работе с ресурсами. С-Change, R-Read, U-Update, D-Download', correct: false, question: questions[5] }
])
