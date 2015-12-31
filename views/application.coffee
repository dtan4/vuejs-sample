new Vue({
  el: '#vue-table',
  data: {
    status: false,
    fields: ['Name', 'Age', 'Address']
    table: [],
    newName: '',
    newAge: '',
    newAddress: '',
  },
  created: ->
    this.fetchData()
  ,
  methods: {
    fetchData: ->
      self = this
      $.getJSON '/table', (json) ->
        self.status = json.status
        self.table = json.table
    ,
    addPerson: ->
      self = this
      data = {
        name: self.newName,
        age: self.newAge,
        address: self.newAddress,
      }
      callback = (json) ->
        self.status = json.status
        self.table = json.table
      $.post '/table', JSON.stringify(data), callback, 'json'
  },
})
