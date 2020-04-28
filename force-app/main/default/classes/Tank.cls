public class Tank {
  public Integer capacity { get; private set; }
  public Integer consumed { get; private set; }

  public Tank(Integer capacity, Integer consumed) {
    this.capacity = capacity;
    this.consumed = consumed;
  }

  public Tank(Integer capacity) {
    this(capacity, 0);
  }

  public Tank() {
    this(5);
  }

  public boolean isEmpty() {
    return consumed == capacity;
  }

  public Tank consume() {
    if (isEmpty()) {
      throw new EmptyTankException();
    }
    return new Tank(capacity, consumed + 1);
  }
}
