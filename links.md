### Resources

The format

- https://manpages.ubuntu.com/manpages/kinetic/en/man5/mtree.5.html
- https://man.freebsd.org/cgi/man.cgi?mtree(5)

Example usage/use-case:

- https://forums.freebsd.org/threads/small-guide-on-using-mtree.61113/
  
  - highlights [IDS](https://en.wikipedia.org/wiki/Intrusion_detection_system) use case
  - general use-case change detection

### Tooling/implementation

- https://github.com/freebsd/freebsd-src/tree/main/contrib/mtree (FreeBSD)
- https://github.com/apple-oss-distributions/file_cmds/tree/file_cmds-400/mtree (macOS)
- https://github.com/vbatts/go-mtree/blob/v0.5.2/cmd/gomtree/main.go (BSD, `*nix`s)
- http://cvsweb.netbsd.org/bsdweb.cgi/src/usr.sbin/mtree/?only_with_tag=netbsd-9-3-RELEASE (NetBSD)
- https://launchpad.net/ubuntu/+source/mtree-netbsd/20180822-6 (Linux - NetBSD as distributed in Ubuntu, included in [Debian](https://packages.debian.org/search?keywords=mtree-netbsd))
- https://github.com/libarchive/libarchive (eg: [`bsdtar`](https://man.freebsd.org/cgi/man.cgi?query=bsdtar&sektion=1&format=html), as a [`libarchive-format`](https://man.freebsd.org/cgi/man.cgi?query=libarchive-formats&sektion=5&apropos=0&manpath=FreeBSD+13.1-RELEASE+and+Ports)) (BSD, `*nix`s, Windows)

### Libraries

- https://github.com/vbatts/go-mtree (Go)
- https://github.com/derekdreery/mtree-rs (Rust)
- https://github.com/libarchive/libarchive/blob/v3.6.2/libarchive/archive_read_support_format_mtree.c (C, C++, and FFI)
