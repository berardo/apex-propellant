/**
 * Partial implementation of Insert rockets (before and after)
 * @author Jose Berardo Cunha
 * @since 30/04/2020
 */
@SuppressWarnings('PMD.EmptyStatementBlock')
public abstract class OnInsertRocket implements OnBeforeRocket, OnAfterRocket {
  protected final List<SObject> newList { get; private set; }
  protected final Map<ID, SObject> newMap { get; private set; }

  public OnInsertRocket() {
  }

  /**
   * Creates an OnInsertRocket with a Set of Objects
   * @param newList Set of SObjects expected to be passed (e.g. Trigger.new)
   */
  public OnInsertRocket(List<SObject> newList) {
    this.newList = newList;
  }

  /**
   * Creates an OnInsertRocket with a Map of Id -> Objects
   * @param newMap Map of Id -> SObject expecteds to be passed (e.g. Trigger.newMap)
   */
  public OnInsertRocket(Map<ID, SObject> newMap) {
    this.newMap = newMap;
  }

  /**
   * Takes the TriggerOperation to fire off on `BEFORE_INSERT` and `AFTER_INSERT`
   * @param triggerWhen System.TriggerOperation
   * @param propellant Propellant object not in use here
   * @returns `Boolean`
   */
  public virtual Boolean canTakeOff(TriggerOperation triggerWhen, Propellant propellant) {
    return triggerWhen == TriggerOperation.BEFORE_INSERT ||
      triggerWhen == TriggerOperation.AFTER_INSERT;
  }

  /**
   * Dummy implementation of OnBeforeRocket
   */
  public virtual void flyOnBefore() {
  }

  /**
   * Dummy implementation of OnAfterRocket
   */
  public virtual void flyOnAfter() {
  }
}
