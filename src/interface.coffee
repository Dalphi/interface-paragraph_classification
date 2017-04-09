class paragraph_classification extends AnnotationIteration
  # uncomment to overwrite interface registration at AnnotationLifecylce
  # constructor: ->
  #    # implement your registration here or call `super`

  # uncomment to overwrite standard mustache templating
  # iterate: (template, data) ->
  #    # implement your rendering here or call `super`

  annotateWith: (label) ->
    @currentData.label = label
    this.saveChanges(@currentData)

window.paragraph_classification = new paragraph_classification()
