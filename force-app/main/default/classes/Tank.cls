/**
 * Object with defined capacity that can be consumed by propellant fires
 * @author Jose Berardo Cunha
 * @since 30/04/2020
 * @see Propellant
 */
public class Tank {
  public final Integer capacity { get; private set; }
  public final Integer consumed { get; private set; }

  /**
   * Creates a tank with defined capacity and consumed amount
   * @param capacity Size of the tank
   * @param consumed Parts of the tank already used
   */
  public Tank(Integer capacity, Integer consumed) {
    this.capacity = capacity;
    this.consumed = consumed;
  }

  /**
   * Creates a tank with defined capacity and 0 on consumed
   * @param capacity Size of the tank
   */
  public Tank(Integer capacity) {
    this(capacity, 0);
  }

  /**
   * Creates a tank with capacity of 5 and consumed of 0
   */
  public Tank() {
    this(5);
  }

  /**
   * Checks if the tanks has been totally consumed
   * @returns `boolean`
   */
  public boolean isEmpty() {
    return consumed >= capacity;
  }

  /**
   * Creates a new tank instance with one up consumed level
   * @returns `Tank` new instance
   * @exception EmptyTankException if there's nothing left on the tank
   */
  public Tank consume() {
    if (isEmpty()) {
      throw new EmptyTankException();
    }
    return new Tank(capacity, consumed + 1);
  }
}
