/**
 * Partial implementation of Undelete rockets (before and after)
 * @author Jose Berardo Cunha
 * @since 30/04/2020
 */
@SuppressWarnings('PMD.EmptyStatementBlock')
public abstract class OnUndeleteRocket implements OnAfterRocket {
  protected final List<SObject> newList { get; private set; }
  protected final Map<ID, SObject> newMap { get; private set; }

  public OnUndeleteRocket() {
  }

  /**
   * Creates an OnUndeleteRocket with a Set of Objects
   * @param newList Set of SObjects expected to be passed (e.g. Trigger.new)
   */
  public OnUndeleteRocket(List<SObject> newList) {
    this.newList = newList;
  }

  /**
   * Creates an OnUndeleteRocket with a Map of Id -> Objects
   * @param newMap Map of Id -> SObject expecteds to be passed (e.g. Trigger.newMap)
   */
  public OnUndeleteRocket(Map<ID, SObject> newMap) {
    this.newMap = newMap;
  }

  /**
   * Takes the TriggerOperation to fire off on `AFTER_UNDELETE`
   * @param triggerWhen System.TriggerOperation
   * @param propellant Propellant object not in use here
   * @returns `Boolean`
   */
  public virtual Boolean canTakeOff(TriggerOperation triggerWhen, Propellant propellant) {
    return triggerWhen == TriggerOperation.AFTER_UNDELETE;
  }

  /**
   * Dummy implementation of OnAfterRocket
   */
  public virtual void flyOnAfter() {
  }
}
