# Expando generates instant data snippets for the Atom editor
![Expando for atom](https://raw.github.com/expandoco/expando-atom/master/expando.gif)

### Installing
Use the Atom package manager, which can be found from the Settings menu or use the command line:

```
apm install expando-atom
```

### Basic usage
Type Expando syntax and then run the `Expando: Expand` command or press `SHIFT+ENTER`. Use CTRL+` for expand-and-beautify combination.

The following basic types are supported:
* `string` random string value
* `int` random integer number
* `float` random float number
* `date` random date
* `bool` random boolean value

More advanced types include:
* `company` random company name
* `email` random email address
* `fname` random first name
* `lname` random last name
* `tel` random telephone number

Separate each type with a comma (`,`)
```
fname,lname,age
```

Specify custom field aliases by using a colon (`:`)
```
firstName:fname,lastName:lname
```

Use brackets for child level objects
```
company,profile:(open:float,close:float)
```

For object arrays, use astrix (`*`)
```
(fname)*10
```

For simple arrays, use `@`
```
tweet:string,tags@5
```

The default generation is `json`, but `xml` and `csv` is also supported
```
items:(string,int)*10=xml
```
or
```
(company,price:float)*10=csv
```
