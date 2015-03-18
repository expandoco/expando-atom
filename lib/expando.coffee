

module.exports =
  activate: ->
    debugger
    view = atom.views.getView(atom.workspace)

    atom.views.getView(atom.workspace).command "expando:expand", => @expand()



  expand: ->

    # This assumes the active pane item is an editor
    editor = atom.workspace.getActiveTextEditor()
    editor.selectToBeginningOfLine()

    selection = editor.getSelection()
    expando = require 'expando'

    output = expando.transform selection.getText()

    #json = JSON.stringify(JSON.parse(output.body), null, '\t');
    #console.log(output)
    selection.insertText(output.body)
    atom.commands.dispatch(atom.views.getView(editor), 'beautify:beautify-editor')
