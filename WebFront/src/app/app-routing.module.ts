import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AnnouncementDetailsComponent } from './announcement-details/announcement-details.component';
import { AnnouncementListComponent } from './announcement-list/announcement-list.component';
import { MapComponent } from './map/map.component';
import { HelpDetailsComponent } from './helpAnnounce/help-details/help-details.component';
import { HelpOverviewComponent } from './helpAnnounce/help-overview/help-overview.component';

const routes: Routes = [
  {path: '', redirectTo: 'annonces', pathMatch: 'full'},
  { path: 'annonces', component:  AnnouncementListComponent },
  { path: 'annonces/:annonceId/detail', component:  AnnouncementDetailsComponent },
  { path: 'map/:annonceId/detail', component:  MapComponent },
  { path: 'helps', component:  HelpOverviewComponent },
  { path: 'helps/:helpId/detail', component:  HelpDetailsComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
