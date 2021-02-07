class VMState {}

class VMLoadingState extends VMState {
  VMLoadingState() : super();
}

class VMErrorState extends VMState {
  VMErrorState(this.msg) : super();
  final String msg;
}

class VMSuccessState<T> extends VMState {
  VMSuccessState(this.value) : super();
  final T value;
}
