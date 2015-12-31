new Vue({
  el: '#vue-table',
  data: {
    status: false,
    table: [],
  },
  created: ->
    this.fetchData()
  ,
  methods: {
    fetchData: ->
      self = this
      $.getJSON 'table', (json) ->
        self.status = json.status
        self.table = json.table
  },
})
