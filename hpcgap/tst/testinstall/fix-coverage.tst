#
# some tests to specifically trigger code which causes the coverage reports on
# codecov to fluctuate (due to indeterminism in the multi threaded execution).
#
# ideally, these should be moved to better fitting test files in the future.
#

# hit early return in TraverseRegionFrom(), from src/hpc/traverse.c
# by doing a StructuralCopy on an object we don't have access on
gap> WaitThread( CreateThread( function() x:=[1,2,3]; end ) );
gap> StructuralCopy(x);
Error, Object not in a readable region


# threadapi.c:
#  - fluctuation in SignalMonitor: need to get to queue = queue->next;
#  - fluctuation in SyncRead
#  - fluctuation in ExpandChannel:  need to grow a full channel 
#  - fluctuation in RetrieveFromChannel : need full channel (?), with channel->head == channel->capacity
#  - add test for TallyChannel
#  - need SendChannel test for full channel


# stdtasks.g:
#   FireTrigger:    if trigger.done then return; fi   at start

# objset.c:249   `hash=0` line in AddObjSetNew()

# funcs.c:540: ReadEvalError call in EvalFunccall2args
#  -> once we can trigger this, trigger it for 0-6 and X args, for better coverage
#      and also in the Proccals
