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

4. Sample syslog output:

        May 30 07:07:51 domU-XX-XX-XX-XX-XX-XX puppet-master[23009]: node=domu-XX-XX-XX-XX-XX-XX.compute-1.internal, configuration_version=1338361671, status=unchanged, kind=apply, environment=production, report=metrics, config_retrieval_seconds=0.266196012496948, filebucket_seconds=0.000195, total_seconds=0.266391012496948, total_changes=0, changed_resources=0, failed_resources=0, failed_to_restart_resources=0, out_of_sync_resources=0, restarted_resources=0, scheduled_resources=0, skipped_resources=6, total_resources=7, failure_events=0, success_events=0, total_events=0

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
