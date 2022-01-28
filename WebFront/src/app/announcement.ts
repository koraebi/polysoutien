import { User } from "./user";

export interface Announcement {
    user: User;
    matiere: String;
    description: String;
    salle: String;
    date: String;
    duree: Number;
}
