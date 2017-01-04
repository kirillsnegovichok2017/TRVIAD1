raffleApp = angular.module('RaffleApp',[])

raffleApp.controller('RaffleCtrl',['$scope', ($scope)->
  $scope.entries = [
    {name: 'Mary'}
    {name: 'Carry'}
    {name: 'Parry'}
  ]

  $scope.addEntry = ->
    if $scope.newEntry.name?
      $scope.entries.push($scope.newEntry)
      $scope.newEntry = {}

  $scope.randArrayItem = (items) ->
    r_item = items[Math.floor(Math.random()*items.length)]

  $scope.drawWinner = ->
    entry = $scope.randArrayItem($scope.entries)
    entry.winner = true
])