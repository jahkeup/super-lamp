MTREE_KEYWORDS = flags,gid,mode,nlink,size,link,time,uid,sha256digest,gname,uname
MTREE_VERIFY_KEYWORDS = flags,gname,uname,link,mode,sha256digest
MTREE_EXTRA_FLAGS=
MTREE = mtree -k $(MTREE_KEYWORDS) -L $(MTREE_EXTRA_FLAGS)
_MTREE = mtree -k $(MTREE_VERIFY_KEYWORDS) -P $(MTREE_EXTRA_FLAGS)

.PHONY: example.txt example_compact.txt
example.txt:
	@make clean
	make example &> $@

example_compact.txt:
	@make clean
	make example MTREE_EXTRA_FLAGS=-n &> $@

example: a.mtree b.mtree
	$(AT)$(_MTREE) -f a.mtree -f b.mtree

compare: AT=@
compare: example

compare-with-numeric-prefix:
	@make compare | awk -F '\t' '{print NF, $$NF}'

%.mtree: %
	$(MTREE) -c -p $* > $@
	@nl -ba -s ' $@> ' $@ >&2
	@echo

clean:
	@rm -f a.mtree b.mtree example.txt

a b:
	tar -xf trees.tar $@
