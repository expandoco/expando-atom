expand = (command) ->


module.exports =
  activate: ->
    #debugger
    #view = atom.views.getView(atom.workspace)
    atom.commands.add 'atom-text-editor', 'expando:expand', => @expand()
    atom.commands.add 'atom-text-editor', 'expando:expand-beautify', => @expandBeautify()


  expand: ->
    editor = atom.workspace.getActiveTextEditor()
    # This assumes the active pane item is an editor
    #debugger
    #atom.commands.dispatch(atom.views.getView(editor), 'grammar-selector:show')

    editor.selectToBeginningOfLine()

    selection = editor.getSelection()
    expando = require 'expando-core'

    output = expando.transform selection.getText()
    nullGrammar = atom.grammars.selectGrammar("text.plain.null-grammar")
    grammars = atom.grammars.getGrammars().filter (grammar) ->
      grammar isnt atom.grammars.nullGrammar


    filteredGrammars = (item for item in grammars when (output.header.generator in item.fileTypes))
    grammar = filteredGrammars[0]

    selection.insertText(output.body)

    if grammar isnt nullGrammar
      atom.grammars.setGrammarOverrideForPath(editor.getPath(), grammar.scopeName)
      editor.setGrammar(grammar)
    editor.moveCursorToBeginningOfLine()
    #atom.commands.dispatch(command)

  expandBeautify: ->
    @expand()
    editorElement = atom.views.getView(atom.workspace.getActiveTextEditor())
    atom.commands.dispatch(editorElement, 'beautify:beautify-editor')
