/**
 * Partial implementation of Insert bullets (before and after)
 * @author Jose Berardo Cunha
 * @since 30/04/2020
 */
public abstract class OnInsertBullet implements OnBeforeBullet, OnAfterBullet {
  protected Set<SObject> newSet { get; private set; }
  protected Map<ID, SObject> newMap { get; private set; }

  @SuppressWarnings('PMD.EmptyStatementBlock')
  private OnInsertBullet() {
  }

  /**
   * Creates an OnInsertBullet with a Set of Objects
   * @param newSet Set of SObjects expected to be passed (e.g. Trigger.new)
   */
  public OnInsertBullet(Set<SObject> newSet) {
    this.newSet = newSet;
  }

  /**
   * Creates an OnInsertBullet with a Map of Id -> Objects
   * @param newMap Map of Id -> SObject expecteds to be passed (e.g. Trigger.newMap)
   */
  public OnInsertBullet(Map<ID, SObject> newMap) {
    this.newMap = newMap;
  }
  
  /**
   * Takes the TriggerOperation to fire off on `BEFORE_INSERT` and `AFTER_INSERT`
   * @param fireWhen System.TriggerOperation
   * @param propellant Propellant object not in use here
   * @returns `Boolean`
   */
  public virtual Boolean canFire(TriggerOperation triggerWhen, Propellant propellant) {
    return triggerWhen == TriggerOperation.BEFORE_INSERT ||
      triggerWhen == TriggerOperation.AFTER_INSERT;
  }
}
