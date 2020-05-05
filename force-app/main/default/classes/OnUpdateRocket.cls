/**
 * Partial implementation of Update rockets (before and after)
 * @author Jose Berardo Cunha
 * @since 30/04/2020
 */
@SuppressWarnings('PMD.EmptyStatementBlock')
public abstract class OnUpdateRocket implements OnBeforeRocket, OnAfterRocket {
  protected final List<SObject> newList { get; private set; }
  protected final List<SObject> oldList { get; private set; }
  protected final Map<ID, SObject> newMap { get; private set; }
  protected final Map<ID, SObject> oldMap { get; private set; }

  public OnUpdateRocket() {
  }

  /**
   * Creates an OnUpdateRocket with a Set of Objects
   * @param newList Set of SObjects expected to be passed (e.g. Trigger.new)
   */
  public OnUpdateRocket(List<SObject> newList) {
    this(newList, null);
  }

  /**
   * Creates an OnUpdateRocket with two Set of Objects
   * @param newList Set of SObjects expected to be passed (e.g. Trigger.new)
   * @param oldList Set of SObjects expected to be passed (e.g. Trigger.old)
   */
  public OnUpdateRocket(List<SObject> newList, List<SObject> oldList) {
    this.newList = newList;
    this.oldList = oldList;
  }

  /**
   * Creates an OnUpdateRocket with a Map of Id -> Objects
   * @param newMap Map of Id -> SObject expected to be passed (e.g. Trigger.newMap)
   */
  public OnUpdateRocket(Map<ID, SObject> newMap) {
    this(newMap, null);
  }

  /**
   * Creates an OnUpdateRocket with two Maps of Id -> Objects
   * @param newMap Map of Id -> SObject expected to be passed (e.g. Trigger.newMap)
   * @param oldMap Map of Id -> SObject expected to be passed (e.g. Trigger.oldMap)
   */
  public OnUpdateRocket(Map<ID, SObject> newMap, Map<ID, SObject> oldMap) {
    this.newMap = newMap;
    this.oldMap = oldMap;
  }

  /**
   * Takes the TriggerOperation to fire off on `BEFORE_UPDATE` and `AFTER_UPDATE`
   * @param triggerWhen System.TriggerOperation
   * @param propellant Propellant object not in use here
   * @returns `Boolean`
   */
  public virtual Boolean canTakeOff(TriggerOperation triggerWhen, Propellant propellant) {
    return triggerWhen == TriggerOperation.BEFORE_UPDATE ||
      triggerWhen == TriggerOperation.AFTER_UPDATE;
  }

  /**
   * Dumb implementation of OnBeforeRocket
   */
  public virtual void flyOnBefore() {
  }

  /**
   * Dumb implementation of OnAfterRocket
   */
  public virtual void flyOnAfter() {
  }
}
