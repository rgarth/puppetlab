# This is the base profile. This should be included by all roles that we
# have in use
class profile::base {
  include ::profile::cron_puppet
  include ::profile::iptables
}
