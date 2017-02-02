raffleApp = angular.module('RaffleApp',["ngResource"])

raffleApp.controller('RaffleCtrl',['$scope','$resource', ($scope, $resource)->
  Entry = $resource("/entries/:id", {id: "@id"}, {update: {method: "PUT"}})
  $scope.entries = Entry.query()

  $scope.addEntry = ->
    if $scope.newEntry.name?
      entry = Entry.save($scope.newEntry)
      $scope.entries.push(entry)
      $scope.newEntry = {}

  $scope.randArrayItem = (items) ->
    items[Math.floor(Math.random()*items.length)]

  $scope.drawWinner = ->
    pool = []
    angular.forEach $scope.entries, (entry)->
      pool.push(entry) if !entry.winner
    if pool.length>0
      entry = $scope.randArrayItem(pool)
      entry.winner = true
      entry.$update();
      $scope.lastWinner = entry

  $scope.isLastWinner = (entry) ->
    $scope.lastWinner == entry
])