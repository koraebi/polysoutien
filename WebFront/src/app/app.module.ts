import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import {MatFormFieldModule} from '@angular/material/form-field';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {MatInputModule} from '@angular/material/input';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { AnnouncementComponent } from './announcement/announcement.component';
import { AnnouncementListComponent } from './announcement-list/announcement-list.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {MatCardModule} from '@angular/material/card';
import {MatButtonModule} from '@angular/material/button';
import {MatToolbarModule} from '@angular/material/toolbar';
import {MatIconModule} from '@angular/material/icon';
import {MatAutocompleteModule} from '@angular/material/autocomplete';

import { AnnouncementDetailsComponent } from './announcement-details/announcement-details.component';
import { InscriptionComponent } from './compte/inscription/inscription.component';
import { ConnexionComponent } from './compte/connexion/connexion.component';
import { PageAccueilComponent } from './page-accueil/page-accueil.component';
import { MapComponent } from './map/map.component';
import {MatMenuModule} from '@angular/material/menu';


@NgModule({
  declarations: [
    AppComponent,
    AnnouncementComponent,
    AnnouncementListComponent,
    AnnouncementDetailsComponent,
    InscriptionComponent,
    ConnexionComponent,
    PageAccueilComponent,
    MapComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    NgbModule,
    MatCardModule,
    MatButtonModule,
    MatToolbarModule,
    MatIconModule,
    BrowserAnimationsModule,
    MatFormFieldModule,
    FormsModule,
    ReactiveFormsModule,
    MatInputModule,
    MatAutocompleteModule,
    MatMenuModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
