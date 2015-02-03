angular.module('simulationGame.services', [])
.factory('ResourceService', function($http, $q){
  var service = {
    getResources: function($http, $q){
      var deferred = $q.derfer();
      http.get('/api/resources').success(function(data){
        var resources = []
        for (var i = 0; i < data.resources.length; i++){
          resources.push( resources[i] );
        }
        deferred.resolve(resources);
      });
      return deferred.promise;
    }
  }
});
