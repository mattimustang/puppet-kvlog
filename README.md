puppet-kvlog
============

Description
-----------

A Puppet report processor for sending metrics to syslog.

Useful for environments using Splunk that want to report on Puppet metrics.

Requirements
------------

* `Puppet`

Installation & Usage
--------------------

1. Install puppet-kvlog as a module in you Puppet master's module path.

2. Enable pluginsync and reports on your master and clients in `puppet.conf`.

        [master]
        report = true
        reports = kvlog
        pluginsync = true
        [agent]
        report = true
        pluginsync = true

3. Run the Puppet client and sync the report processor as a plugin.

Author
------

Matthew Flanagan <mattimustang@gmail.com>

License
-------

    Author:: Matthew Flanagan (<mattimustang@gmail.com>)
    Copyright:: Copyright (c) 2012 Matthew Flanagan
    License:: Apache License, Version 2.0

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
