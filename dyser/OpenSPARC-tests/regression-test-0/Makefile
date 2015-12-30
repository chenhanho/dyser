
GCC=/p/vertical/projects/dyser/install/gcc-4.1.0-glibc-2.3.6/sparc-unknown-linux-gnu/bin/sparc-unknown-linux-gnu-gcc
CXX=/p/vertical/projects/dyser/install/gcc-4.1.0-glibc-2.3.6/sparc-unknown-linux-gnu/bin/sparc-unknown-linux-gnu-g++


REGRESSION=/u/b/e/benson/private/ece752/project/svn/opensplyser/dyser_df/code/regression


ASSEMBLIES=increment.s straight-thru-0.s straight-thru-1.s activate_func_00.s activate_func_01.s activate_func_10.s activate_func_11.s constant_func_00.s partial-config.s complex_func_00.s bad-0.s bad-1.s good-0.s good-1.s
BINARIES=increment straight-thru-0 straight-thru-1 activate_func_00 activate_func_01 activate_func_10 activate_func_11 constant_func_00 partial-config complex_func_00 bad-0 bad-0.baseline bad-1 bad-1.baseline good-0 good-0.baseline good-1 good-1.baseline


all: $(ASSEMBLIES) $(BINARIES)


%.s: %.work.s
	../DySERAssemble.pl $< > $@
	cp $@ $(REGRESSION)/$@


%: %.s
	$(GCC) $< -o $@
	cp $@ $(REGRESSION)/$@


clean:
	rm -f *~ $(ASSEMBLIES) $(BINARIES) 

