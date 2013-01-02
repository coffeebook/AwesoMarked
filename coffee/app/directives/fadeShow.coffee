aMarked.directive 'fadeShow', ->
  (scope, elem, attrs) ->
    $elem = $(elem)
    exp = attrs.fadeShow

    # Check if we're mobile and don't animate by default if so
    duration = 400

    # Fade fn. If init is true (initial load) and exp
    # is false then hide instantly (prevent flash of content)
    fadeElem = (toShow, init = false) ->
      if toShow
        $elem.fadeIn(duration)
      else
        if init then $elem.hide() else $elem.fadeOut(duration)
      return

    fadeElem(scope.$eval(exp), true)

    # Set watch
    scope.$watch ->
      scope.$eval exp
    , fadeElem