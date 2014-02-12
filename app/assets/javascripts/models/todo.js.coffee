Todo.Todo = DS.Model.extend
  summary: DS.attr('string'),
  is_completed: DS.attr('boolean')

Todo.Todo.FIXTURES = [
 {
   id: 1,
   summary: 'Learn Ember.js',
   is_completed: true
 },
 {
   id: 2,
   summary: '...',
   is_completed: false
 },
 {
   id: 3,
   summary: 'Profit!',
   is_completed: false
 }
]
