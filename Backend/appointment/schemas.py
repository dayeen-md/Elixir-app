from pydantic import BaseModel


class AppointmentBase(BaseModel):
    disease: str
    syndrome: str
    disorder: str
    info: str
    patient_id: int

    class Config:
        orm_mode = True


class Appointment(AppointmentBase):
    class Config:
        orm_mode = True


class User(BaseModel):
    username: str
    email: str
    password: str

    class Config:
        orm_mode = True


class ShowUser(BaseModel):
    username: str
    email: str
    appointment: list

    class Config:
        orm_mode = True


class ShowAppointment(BaseModel):
    disease: str
    syndrome: str
    disorder: str
    info: str
    patient: ShowUser

    class Config:
        orm_mode = True


class Login(BaseModel):
    email: str
    password: str
