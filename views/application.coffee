apiURL = 'https://api.github.com/repos/vuejs/vue/commits?per_page=3&sha='

demo = new Vue({
  el: '#demo',
  data: {
    branches: ['master', 'dev'],
    currentBranch: 'master',
    commits: null,
  },
  created: ->
    this.fetchData()
  ,
  watch: {
    currentBranch: 'fetchData'
  },
  filters: {
    truncate: (v) ->
      newline = v.indexOf('\n')
      if newline > 0 then v.slice(0, newline) else v
    ,
    formatDate: (v) ->
      v.replace(/T|Z/g, ' ')
  },
  methods: {
    fetchData: ->
      self = this
      $.getJSON apiURL + self.currentBranch, (json) ->
        self.commits = json
  }
})
