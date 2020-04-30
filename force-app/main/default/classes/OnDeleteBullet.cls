/**
 * Partial implementation of Delete bullets (before and after)
 * @author Jose Berardo Cunha
 * @since 30/04/2020
 */
public abstract class OnDeleteBullet implements OnBeforeBullet, OnAfterBullet {
  protected Set<SObject> oldSet { get; private set; }
  protected Map<ID, SObject> oldMap { get; private set; }

  @SuppressWarnings('PMD.EmptyStatementBlock')
  private OnDeleteBullet() {
  }

  /**
   * Creates an OnDeleteBullet with a Set of Objects
   * @param oldSet Set of SObjects expected to be passed (e.g. Trigger.old)
   */
  public OnDeleteBullet(Set<SObject> oldSet) {
    this.oldSet = oldSet;
  }

  /**
   * Creates an OnUpdateBullet with a Map of Id -> Objects
   * @param oldMap Map of Id -> SObject expecteds to be passed (e.g. Trigger.oldMap)
   */
  public OnDeleteBullet(Map<ID, SObject> oldMap) {
    this.oldMap = oldMap;
  }

  /**
   * Takes the TriggerOperation to fire off on `BEFORE_DELETE` and `AFTER_DELETE`
   * @param fireWhen System.TriggerOperation
   * @param propellant Propellant object not in use here
   * @returns `Boolean`
   */
  public virtual Boolean canFire(TriggerOperation triggerWhen, Propellant propellant) {
    return triggerWhen == TriggerOperation.BEFORE_DELETE ||
      triggerWhen == TriggerOperation.AFTER_DELETE;
  }
}
