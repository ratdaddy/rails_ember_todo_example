Todo.Todo = DS.Model.extend
  summary: DS.attr('string'),
  isCompleted: DS.attr('boolean')

Todo.Todo.FIXTURES = [
 {
   id: 1,
   summary: 'Learn Ember.js',
   isCompleted: true
 },
 {
   id: 2,
   summary: '...',
   isCompleted: false
 },
 {
   id: 3,
   summary: 'Profit!',
   isCompleted: false
 }
]
