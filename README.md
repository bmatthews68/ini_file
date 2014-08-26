ini_file Cookbook
================
This cookbook implements a Light Weight Resource Provider (LWRP) for maintaining .ini
files.

Requirements
------------
- Chef 11 or higher
- Ruby 1.9.3 or higher

Attributes
----------
TODO: List your cookbook attributes here.

e.g.
#### inifile::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['inifile']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Actions
-------
create
create\_if\_missing
update

Usage
-----
If you're using Berkshelf, just add ini_file to your Berksfile:

cookbook 'ini_file'

Otherwise, install the cookbook from the community site:

knife cookbook site install ini_file

Have any other cookbooks depend on ini_file by editing the metadata.rb for your cookbok

# metadata.rb
depends 'ini_file'

#### inifile::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `inifile` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[inifile]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Brian Matthews (brian@btmatthews.com)
