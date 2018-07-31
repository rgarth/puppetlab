# Simple Puppet Test enironment

This repo can be used to setup a simple, serverless, puppet managed vagrant EL7 host.

The vagrant file will create the guest, using Virtual Box, and setup a puppet environment.
The configuration changes are made just using puppet-apply, not a puppet client/server setup.

I use this primarily for hacking puppet modules

I generally make changes on the host computer, and the run `vagrant rsync` to get those changes onto the guest before running
`/usr/local/bin/puppet-apply`
