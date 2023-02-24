MTREE_KEYWORDS = flags,gid,mode,nlink,size,link,time,uid,sha256digest,gname,uname
MTREE_VERIFY_KEYWORDS = flags,gname,uname,link,mode,sha256digest
MTREE = mtree -k $(MTREE_KEYWORDS) -L
_MTREE = mtree -k $(MTREE_VERIFY_KEYWORDS) -P

.PHONY: example.txt
example.txt:
	@make clean
	make example &> $@

example: a.mtree b.mtree
	$(_MTREE) -f a.mtree -f b.mtree

%.mtree: %
	$(MTREE) -c -p $* > $@
	@nl -ba -s ' $@> ' $@ >&2
	@echo

clean:
	@rm -f a.mtree b.mtree example.txt

a b:
	tar -xf trees.tar $@
