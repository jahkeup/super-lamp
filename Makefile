MTREE_KEYWORDS = flags,gid,mode,nlink,size,link,time,uid,sha256digest,gname,uname
MTREE_VERIFY_KEYWORDS = flags,gname,uname,link,mode,sha256digest
MTREE_EXTRA_FLAGS=
MTREE = mtree -k $(MTREE_KEYWORDS) -L $(MTREE_EXTRA_FLAGS)
_MTREE = mtree -k $(MTREE_VERIFY_KEYWORDS) -P $(MTREE_EXTRA_FLAGS)

all:
	@make clean
	-make example.txt
	-make example_compact.txt
	-make example_delta.txt

.PHONY: docs
docs:
	$(MAKE) all
	cp -fv example_*.txt docs/

.PHONY: example.txt example_compact.txt
example.txt:
	@-rm -f a.mtree b.mtree
	-make example &> $@

example_compact.txt:
	@-rm -f a.mtree b.mtree
	-make example MTREE_EXTRA_FLAGS=-n &> $@

example_delta.txt:
	@-rm -f a.mtree b.mtree
	-make compare-with-numeric-prefix > $@

example: a.mtree b.mtree
	$(AT)$(_MTREE) -f a.mtree -f b.mtree

compare: AT=@
compare: example

compare-with-numeric-prefix:
	@make compare | awk -F '\t' '{print "Fields:", NF, "", "Last field:", $$NF}'

%.mtree: %
	$(MTREE) -c -p $* > $@
	@nl -ba -s ' $@> ' $@ >&2
	@echo

clean:
	@rm -rf a.mtree b.mtree a b
	@rm -f $(wildcard example*.txt)

a b:
	tar -xf trees.tar $@

trees.tar:
	tar -cf $@ a b
