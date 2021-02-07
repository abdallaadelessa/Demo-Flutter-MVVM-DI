class VMState {}

class VMLoadingState extends VMState {
  VMLoadingState() : super();
}

class VMErrorState extends VMState {
  VMErrorState(this.msg) : super();
  final String msg;
}

class VMContentState<T> extends VMState {
  VMContentState(this.value) : super();
  final T value;
}
