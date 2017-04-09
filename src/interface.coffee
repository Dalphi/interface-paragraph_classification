class paragraph_classification extends AnnotationIteration

  _this = undefined

  constructor: ->
    _this = this
    this.knownKeys = [48, 49, 50, 51, 52, 53, 54, 55, 56, 57]
    this.keyMap = []
    this.initKeyboardEventHandler()

  initKeyboardEventHandler: ->
    $(document).off 'keydown'
    $(document).keydown (e) ->
      returnStatement = true
      returnStatement = false if _this.knownKeys.indexOf(e.keyCode) >= 0
      return returnStatement unless _this.keyMap.indexOf(e.keyCode) == -1

      _this.keyMap.push(e.keyCode)
      _this.actionFromKeyEvent()
      return returnStatement

    $(document).off 'keyup'
    $(document).keyup (e) ->
      keyMapIndex = _this.keyMap.indexOf(e.keyCode)
      _this.keyMap.splice(keyMapIndex)

  actionFromKeyEvent: ->
    keyIsPressed = (keyId) ->
      _this.keyMap.indexOf(keyId) >= 0

    this.annotateWithCssClass('.label-0') if keyIsPressed(48) # key '0'
    this.annotateWithCssClass('.label-1') if keyIsPressed(49) # key '1'
    this.annotateWithCssClass('.label-2') if keyIsPressed(50) # key '2'
    this.annotateWithCssClass('.label-3') if keyIsPressed(51) # key '3'
    this.annotateWithCssClass('.label-4') if keyIsPressed(52) # key '4'
    this.annotateWithCssClass('.label-5') if keyIsPressed(53) # key '5'
    this.annotateWithCssClass('.label-6') if keyIsPressed(54) # key '6'
    this.annotateWithCssClass('.label-7') if keyIsPressed(55) # key '7'
    this.annotateWithCssClass('.label-8') if keyIsPressed(56) # key '8'
    this.annotateWithCssClass('.label-9') if keyIsPressed(57) # key '9'

  annotateWithCssClass: (cssClass) ->
    label = $(cssClass).data('label')
    this.annotateWith(label)

  annotateWith: (label) ->
    console.log "save annotation with label '#{label}'"
    @currentData.label = label
    this.saveChanges(@currentData)

window.paragraph_classification = new paragraph_classification()
