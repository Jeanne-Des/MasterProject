from configs.db_config import db
from models.user_model import User


def create_user(tally_id, isAdmin):
    # Check if user already exists
    existing_user = db.session.query(User).filter_by(tally_id_user=tally_id).first()
    if existing_user:
        return existing_user

    user = User(
        tally_id=tally_id,
        is_admin=isAdmin,
    )

    # Add user to database
    db.session.add(user)
    db.session.commit()
    return user