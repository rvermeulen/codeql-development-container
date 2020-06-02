# CodeQL Development Container

## Usage

Dependencies:
- Docker
- Visual Studio Code + Remote - Container extension

### Example 1 - GitHub Security Lab CTF 4 'Code and Chill'

In the first example use case we will use an already available database.

1. Clone this repository - `git clone https://github.com/rvermeulen/codeql-development-container code-and-chill`
2. Open the repository in _Visual Studio Code_ - `code code-and-chill` (This assumes you installed the [`code` command](https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line))
3. With the _Remote Container_ extension installed, _Visual Studio Code_ will detect the _dev container configuration_ and ask to `Reopen in Container`.

With the openend project now running in the _dev container_ we are ready to start the CTF.
1. Head over to https://securitylab.github.com/ctf/codeql-and-chill.
2. In the _Setup instructions_ section you can find the link to the database. Download the dabase and move it into the existing database fodler.
3. In _Visual Studio Code_ start a new _Terminal_. You will see a prompt similar to `codeql@98bf68344db6:/workspaces/code-and-chill$ `
4. Change the directory to `databases` and unzip the database `unzip titus-control-plane-db.zip `
5. Now activate the database by performing a `right click` on the `titus-control-plane-db` subfolder in the _Visual Code Explorer_ and click on the menu item `CodeQL: Set current database`

With an active database we are ready to query the database.

1. Add a folder `queries` to the project via the _Visual Studio Code Explorer_.
2. Copy the `qlpack.yml` from the `java` subfolder residing in the `examples` folder to the `queries` folder.
3. Create a new file `solution.ql` in the `queries` folder.

To test the setup you can run the following query. It should return 6 results.

```codeql
import java

from ParameterizedType pt, ClassOrInterface c
where pt.getGenericType().hasName("ConstraintValidator") and
      c.extendsOrImplements(pt)
select c
```