/**
 * Partial implementation of Undelete rockets (before and after)
 * @author Jose Berardo Cunha
 * @since 30/04/2020
 */
public abstract class OnUndeleteRocket implements OnAfterRocket {
  protected Set<SObject> newSet { get; private set; }
  protected Map<ID, SObject> newMap { get; private set; }

  @SuppressWarnings('PMD.EmptyStatementBlock')
  private OnUndeleteRocket() {
  }

  /**
   * Creates an OnUndeleteRocket with a Set of Objects
   * @param newSet Set of SObjects expected to be passed (e.g. Trigger.new)
   */
  public OnUndeleteRocket(Set<SObject> newSet) {
    this.newSet = newSet;
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
   * @param fireWhen System.TriggerOperation
   * @param propellant Propellant object not in use here
   * @returns `Boolean`
   */
  public virtual Boolean canFire(TriggerOperation triggerWhen, Propellant propellant) {
    return triggerWhen == TriggerOperation.AFTER_UNDELETE;
  }
}
