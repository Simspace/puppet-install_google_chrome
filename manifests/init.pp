class install_google_chrome (
  $installer = $install_google_chrome::params::installer,
) inherits install_google_chrome::params {
  include staging

  if $::operatingsystem == 'windows' {

    $msi = inline_template('<%= File.basename(@installer) %>')

    acl { "${staging_windir}/install_google_chrome/${msi}":
      purge => false,
      permissions => [ { identity => 'Administrators', rights => ['full'] },],
      }

      staging::file { $msi:
        source => $installer,
        }


        package { 'Chrome':
          ensure => installed,
          source => "${staging_windir}\\install_google_chrome\\${msi}",
          require => [ Staging::File[$msi], Acl["${staging_windir}/install_google_chrome/${msi}"] ],
          install_options => '/q',
          }
  }
}
