/// Type definitions for reactor related types
module mecca.reactor.types;

import mecca.lib.exception;
import mecca.lib.typedid;

/// Fibers' ID type
alias FiberId = TypedIdentifier!("FiberId", ushort, ushort.max, ushort.max);

/// Exception thrown when a fiber is suspended for too long.
class TimeoutExpired : Exception {
    this(string file = __FILE__, size_t line = __LINE__, Throwable next = null) @safe pure nothrow @nogc {
        super("Reactor timed out on a timed suspend", file, line, next);
    }
}

class TaskInterrupt : Throwable {
    mixin ExceptionBody;
}

class ReactorExit : TaskInterrupt {
    mixin ExceptionBody!("Reactor is quitting");
}

