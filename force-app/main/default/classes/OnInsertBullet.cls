public abstract class OnInsertBullet implements OnBeforeBullet, OnAfterBullet {
  protected Set<SObject> newSet { get; private set; }
  protected Map<ID, SObject> newMap { get; private set; }

  @SuppressWarnings('PMD.EmptyStatementBlock')
  private OnInsertBullet() {
  }
  public OnInsertBullet(Set<SObject> newSet) {
    this.newSet = newSet;
  }
  public OnInsertBullet(Map<ID, SObject> newMap) {
    this.newMap = newMap;
  }
  public virtual Boolean canFire(TriggerOperation triggerWhen, Propellant propellant) {
    return triggerWhen == TriggerOperation.BEFORE_INSERT ||
      triggerWhen == TriggerOperation.AFTER_INSERT;
  }
}
